from sklearn.metrics import confusion_matrix, accuracy_score
from sklearn.model_selection import StratifiedKFold
import matplotlib.pyplot as plt
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn import tree, preprocessing
import graphviz
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
            score_values[rep, depth] = accuracy_score(Y, predicted_labels)
            score_values_gini[rep, depth] = accuracy_score(Y, predicted_labels_gini)

    mean_score_ent = np.mean(score_values, 0)
    std_score_ent  = np.std(score_values,  0)
    mean_score_gini = np.mean(score_values_gini, 0)
    std_score_gini  = np.std(score_values_gini,  0)
    plt.errorbar(range(1, depth_range), mean_score_ent[1:],  std_score_ent[1:],  fmt='-o', label='Entropy')
    plt.errorbar(range(1, depth_range), mean_score_gini[1:], std_score_gini[1:], fmt='-o', label='Gini')
    #plt.plot(range(1, depth_range), mean_score_gini[1:], '-o', label='Gini Impurity')
    #plt.axhline(y=0.65, color='r', linestyle='--')
    plt.ylim(0.4, 1)
    plt.xlim(0, depth_range)
    plt.legend()
    #plt.legend((line_ent, line_gini), ('Entropy criterion', 'Gini Impurity'))
    plt.grid()
    plt.xlabel('Tree Depth')
    plt.ylabel('Accuracy')
    plt.title('Accuracy with decision tree')
    plt.savefig('../figures/accuracy_decision_tree.png')
    plt.show()

    iris = load_iris()
    iris_names = iris.feature_names
    feature_names = ['We', 'B', 'delta', 'P', 'mu']
    feature_names = ['We', 'B', 'delta', 'P', 'mu', 'C2', 'C3', 'C1']
    class_names = ['1', '2', '3', '4']
    dot_data = tree.export_graphviz(clf, out_file=None,
                                    feature_names=feature_names,
                                    class_names=class_names,
                                    filled=True, rounded=True,
                                    special_characters=True)
    graph = graphviz.Source(dot_data)
    graph.render("../figures/tree_visualization")

    conf_mat = confusion_matrix(Y, predicted_labels) / len(Y)
    return np.mean(score_values[1:])


def random_forest(X_scaled, Y):
    skf = StratifiedKFold(n_splits=10, shuffle=True )
    predicted_labels_randforest = -1 * np.ones(len(X_scaled))
    for train, test in skf.split(X_scaled, Y):
        train_x = X_scaled[train, :]
        train_y = Y[train]
        clf = RandomForestClassifier(n_estimators=100, max_depth=10,
                                     random_state=1)
        clf.fit(train_x, train_y)
        predicted_labels_randforest[test] = clf.predict(X_scaled[test, :])

    score_rand_forest = accuracy_score(predicted_labels_randforest, Y)
    return score_rand_forest
