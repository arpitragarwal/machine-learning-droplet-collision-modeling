from sklearn.metrics import confusion_matrix, accuracy_score
from sklearn.model_selection import StratifiedKFold
import matplotlib.pyplot as plt
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn import tree, preprocessing
import graphviz
from sklearn.externals.joblib import dump, load
from sklearn.datasets import load_iris

def decision_tree(X_scaled, Y):
    print("Building decision trees...")
    n_repetitions = 10
    depth_range = 21
    score_values      = np.zeros((n_repetitions, depth_range))
    score_values_gini = np.zeros((n_repetitions, depth_range))
    for rep in range(0, n_repetitions):
        for depth in range(1, depth_range):
            skf = StratifiedKFold(n_splits=10, shuffle=True)
            predicted_labels = -1 * np.ones(len(X_scaled))
            predicted_labels_gini = -1 * np.ones(len(X_scaled))
            for train, test in skf.split(X_scaled, Y):
                train_x = X_scaled[train, :]
                train_y = Y[train]
                clf = tree.DecisionTreeClassifier(max_depth=depth, criterion="entropy")
                clf = clf.fit(train_x, train_y)
                predicted_labels[test] = clf.predict(X_scaled[test, :])
                clf2 = tree.DecisionTreeClassifier(max_depth=depth, criterion="gini")
                clf2 = clf2.fit(train_x, train_y)
                predicted_labels_gini[test] = clf2.predict(X_scaled[test, :])

            if accuracy_score(Y, predicted_labels_gini) > max(score_values_gini[rep, :]):
                predicted_labels_dt_best = predicted_labels_gini
                best_score = accuracy_score(Y, predicted_labels_gini)
                dump(clf2, '../trained_models/decision_tree.joblib')
                np.savetxt("../trained_models/predicted_labels_decision_tree.csv",
                           predicted_labels_gini, fmt='%i', delimiter=",")
            score_values[rep, depth] = accuracy_score(Y, predicted_labels)
            score_values_gini[rep, depth] = accuracy_score(Y, predicted_labels_gini)

    mean_score_ent = np.mean(score_values, 0)
    std_score_ent  = np.std(score_values,  0)
    mean_score_gini = np.mean(score_values_gini, 0)
    std_score_gini  = np.std(score_values_gini,  0)

    np.savetxt("../trained_models/scores_dt_ent.csv", mean_score_ent, delimiter=",")
    np.savetxt("../trained_models/scores_dt_gini.csv", mean_score_gini, delimiter=",")

    plt.errorbar(range(1, depth_range), mean_score_ent[1:],  std_score_ent[1:],  fmt='-o', label='Entropy')
    plt.errorbar(range(1, depth_range), mean_score_gini[1:], std_score_gini[1:], fmt='-o', label='Gini')
    #plt.plot(range(1, depth_range), mean_score_gini[1:], '-o', label='Gini Impurity')
    #plt.axhline(y=0.65, color='r', linestyle='--')
    plt.ylim(0.6, 1)
    plt.xlim(0, depth_range)
    plt.legend()
    #plt.legend((line_ent, line_gini), ('Entropy criterion', 'Gini Impurity'))
    plt.grid()
    plt.xlabel('Tree Depth')
    plt.ylabel('Accuracy')
    plt.title('Accuracy with decision tree')
    plt.savefig('../figures/accuracy_decision_tree.png')
    plt.show()

    feature_names = ['We', 'B', 'delta', 'P', 'mu']
    #feature_names = ['We', 'B', 'delta', 'P', 'mu', 'C2', 'C3', 'C1']
    class_names = ['1', '2', '3', '4']
    dot_data = tree.export_graphviz(clf, out_file=None,
                                    feature_names=feature_names,
                                    class_names=class_names,
                                    filled=True, rounded=True,
                                    special_characters=True)
    graph = graphviz.Source(dot_data)
    graph.render("../figures/tree_visualization")

    conf_mat = confusion_matrix(Y, predicted_labels) / len(Y)
    return best_score, predicted_labels_dt_best


def random_forest(X_scaled, Y):
    print('Building random forest classifiers...')
    no_estimators = 2**np.arange(0, 9, 1)
    score_forests_d1 = np.array([])
    score_forests_d2 = np.array([])
    predicted_labels_randforest_d1_best = -1 * np.ones(len(X_scaled))
    predicted_labels_randforest_d2_best = -1 * np.ones(len(X_scaled))
    for num in no_estimators:
        skf = StratifiedKFold(n_splits=10, shuffle=True )
        predicted_labels_randforest_d1 = -1 * np.ones(len(X_scaled))
        predicted_labels_randforest_d2 = -1 * np.ones(len(X_scaled))
        for train, test in skf.split(X_scaled, Y):
            train_x = X_scaled[train, :]
            train_y = Y[train]

            clf = RandomForestClassifier(n_estimators=num, max_depth= 16, criterion="entropy", verbose=True)
            clf.fit(train_x, train_y)
            predicted_labels_randforest_d1[test] = clf.predict(X_scaled[test, :])

            clf2 = RandomForestClassifier(n_estimators=num, max_depth=32, criterion="entropy", verbose=True)
            clf2.fit(train_x, train_y)
            predicted_labels_randforest_d2[test] = clf2.predict(X_scaled[test, :])

        score_d1_curr = accuracy_score(predicted_labels_randforest_d1, Y)
        score_d2_curr = accuracy_score(predicted_labels_randforest_d2, Y)

        if len(score_forests_d1) > 0:
            if score_d1_curr > max(score_forests_d1):
                predicted_labels_randforest_d1_best = predicted_labels_randforest_d1
                dump(clf, '../trained_models/random_forest.joblib')
                np.savetxt("../trained_models/predicted_labels_random_forest.csv",
                           predicted_labels_randforest_d1, fmt='%i', delimiter=",")
            if score_d2_curr > max(score_forests_d2):
                predicted_labels_randforest_d2_best = predicted_labels_randforest_d2
                dump(clf2, '../trained_models/random_forest.joblib')
                np.savetxt("../trained_models/predicted_labels_random_forest.csv",
                           predicted_labels_randforest_d2, fmt='%i', delimiter=",")

        score_forests_d1 = np.append(score_forests_d1, score_d1_curr)
        score_forests_d2 = np.append(score_forests_d2, score_d2_curr)

    np.savetxt("../trained_models/scores_rand_forest_d2.csv", score_forests_d2, delimiter=",")
    np.savetxt("../trained_models/scores_rand_forest_d2.csv", score_forests_d1, delimiter=",")

    plt.plot(no_estimators, score_forests_d1, '-o', label='max depth = 16')
    plt.plot(no_estimators, score_forests_d2, '-o', label='max depth = 32')
    plt.ylim(0.6, 1)
    #plt.xlim(0, max(no_neighbors))
    plt.xscale("log")
    plt.grid()
    plt.xlabel('No. of estimators')
    plt.ylabel('Accuracy')
    plt.title('Accuracy with random forests')
    plt.legend()
    plt.savefig('../figures/accuracy_rand_forests.png')
    plt.show()

    return max(score_forests_d2), predicted_labels_randforest_d2_best
