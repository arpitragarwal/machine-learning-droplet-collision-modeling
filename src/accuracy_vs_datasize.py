from sklearn.metrics import confusion_matrix, accuracy_score
from sklearn.model_selection import StratifiedKFold, GroupShuffleSplit
import matplotlib.pyplot as plt
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn import tree, preprocessing
from sklearn.neighbors import KNeighborsClassifier, RadiusNeighborsClassifier
from feature_engineering import feature_engineering
from sklearn.neural_network import MLPClassifier


def accuracy_vs_n(X_scaled, Y, percent_data):
    total_size = len(Y)
    size_data_set = np.floor(percent_data * total_size)

    score_values_dt        = np.zeros(len(size_data_set))
    score_values_knn1_dist = np.zeros(len(size_data_set))
    score_values_nn        = np.zeros(len(size_data_set))

    for i in range(len(size_data_set)):
        sample = np.random.choice(total_size, size_data_set[i].astype(int))
        X_sample = X_scaled[sample, :]
        Y_sample = Y[sample]

        skf = StratifiedKFold(n_splits=3, shuffle=True)
        predicted_labels_dt         = -1 * np.ones(len(X_sample))
        predicted_labels_knn1_dist  = -1 * np.ones(len(X_sample))
        #predicted_labels_nn         = -1 * np.ones(len(X_sample))

        for train, test in skf.split(X_sample, Y_sample):
            train_x = X_sample[train, :]
            train_y = Y_sample[train]
            test_x  = X_sample[test, :]

            clf_dt = tree.DecisionTreeClassifier(max_depth=20, criterion="gini")
            clf_dt = clf_dt.fit(train_x, train_y)
            predicted_labels_dt[test] = clf_dt.predict(test_x)
            del clf_dt

            neigh = KNeighborsClassifier(n_neighbors=16, weights='distance', p=1)
            neigh.fit(train_x, train_y)
            predicted_labels_knn1_dist[test] = neigh.predict(test_x)
            del neigh

            #clf_nn = MLPClassifier(solver='sgd', max_iter=300, tol=1e-7, shuffle=True,
            #                    hidden_layer_sizes=(40, 40, 8), verbose=True)
            #clf_nn.fit(train_x, train_y)
            #predicted_labels_nn[test] = clf_nn.predict(test_x)

        score_values_dt[i]         = accuracy_score(Y_sample, predicted_labels_dt)
        score_values_knn1_dist[i]  = accuracy_score(Y_sample, predicted_labels_knn1_dist)
        #score_values_nn[i]         = accuracy_score(Y_sample, predicted_labels_nn)

    return score_values_dt, score_values_knn1_dist, size_data_set
    a = 10

generate_data = False
if generate_data:
    filename = '../reference data/collision_data_compiled.csv'
    my_data = np.genfromtxt(filename, delimiter=',')
    X_wo = my_data[:, :-1]
    Y    = my_data[:, -1]

    X_w = feature_engineering(X_wo)
    X_w_scaled  = preprocessing.scale(X_w)
    X_wo_scaled = preprocessing.scale(X_wo)

    percent_data = np.array([2, 5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100])/100.0
    n_runs = 40
    score_values_dt_w  = np.zeros([n_runs, len(percent_data)])
    score_values_knn_w = np.zeros([n_runs, len(percent_data)])
    score_values_dt_wo  = np.zeros([n_runs, len(percent_data)])
    score_values_knn_wo = np.zeros([n_runs, len(percent_data)])
    for i in range(n_runs):
        score_values_dt_wo[i, :], score_values_knn_wo[i, :], size_data_set = accuracy_vs_n(X_wo_scaled, Y, percent_data)
        score_values_dt_w [i, :], score_values_knn_w [i, :], size_data_set = accuracy_vs_n(X_w_scaled,  Y, percent_data)


    np.savetxt("../trained_models/accuracy_vs_size/scores_dt_wo.csv", score_values_dt_wo, delimiter=",")
    np.savetxt("../trained_models/accuracy_vs_size/scores_dt_w.csv", score_values_dt_w, delimiter=",")
    np.savetxt("../trained_models/accuracy_vs_size/scores_knn_wo.csv", score_values_knn_wo, delimiter=",")
    np.savetxt("../trained_models/accuracy_vs_size/scores_knn_w.csv", score_values_knn_w, delimiter=",")
    np.savetxt("../trained_models/accuracy_vs_size/size_data_set.csv", size_data_set, delimiter=",")

else:
    score_values_dt_wo = np.genfromtxt("../trained_models/accuracy_vs_size/scores_dt_wo.csv", delimiter=',')
    score_values_dt_w  = np.genfromtxt("../trained_models/accuracy_vs_size/scores_dt_w.csv", delimiter=',')
    score_values_knn_wo = np.genfromtxt("../trained_models/accuracy_vs_size/scores_knn_wo.csv", delimiter=',')
    score_values_knn_w  = np.genfromtxt("../trained_models/accuracy_vs_size/scores_knn_w.csv", delimiter=',')
    size_data_set = np.genfromtxt("../trained_models/accuracy_vs_size/size_data_set.csv", delimiter=',')

plt.errorbar(size_data_set, np.average(score_values_dt_w, 0), yerr=2*np.std(score_values_dt_w, 0), linestyle='-', color='b', label='DT (with)')
plt.errorbar(size_data_set, np.average(score_values_dt_wo, 0), yerr=2*np.std(score_values_dt_wo, 0), linestyle='--', color='c', label='DT (without)')
plt.errorbar(size_data_set, np.average(score_values_knn_w, 0), yerr=2*np.std(score_values_knn_w, 0), linestyle='-', color='r', label='k-NN (with)')
plt.errorbar(size_data_set, np.average(score_values_knn_wo, 0), yerr=2*np.std(score_values_knn_wo, 0), linestyle='--', color='m', label='k-NN (without)')
plt.legend()
plt.grid()
#plt.xlim(0, 2000)
#plt.ylim(0.7, 0.85)
plt.ylim(0.6, 1)
plt.ylabel('Accuracy')
plt.xlabel('No. of data points')
plt.savefig('../figures/accuracy_vs_size.png')
plt.show()
a = 10