from sklearn.metrics import confusion_matrix, accuracy_score
from sklearn.model_selection import StratifiedKFold, GroupShuffleSplit
import matplotlib.pyplot as plt
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn import tree, preprocessing
from sklearn.neighbors import KNeighborsClassifier, RadiusNeighborsClassifier
from feature_engineering import feature_engineering
from sklearn.neural_network import MLPClassifier

def get_cv_accuracy(X_scaled, Y):
    skf = StratifiedKFold(n_splits=3, shuffle=True)
    predicted_labels_dt         = -1 * np.ones(len(X_scaled))
    predicted_labels_knn1_dist  = -1 * np.ones(len(X_scaled))
    predicted_labels_nn         = -1 * np.ones(len(X_scaled))
    predicted_labels_rf         = -1 * np.ones(len(X_scaled))

    for train, test in skf.split(X_scaled, Y):
        train_x = X_scaled[train, :]
        train_y = Y[train]
        test_x  = X_scaled[test, :]

        clf_dt = tree.DecisionTreeClassifier(max_depth=20, criterion="gini")
        clf_dt = clf_dt.fit(train_x, train_y)
        predicted_labels_dt[test] = clf_dt.predict(test_x)
        del clf_dt

        neigh = KNeighborsClassifier(n_neighbors=16, weights='distance', p=1)
        neigh.fit(train_x, train_y)
        predicted_labels_knn1_dist[test] = neigh.predict(test_x)
        del neigh

        clf_nn = MLPClassifier(solver='sgd', max_iter=300, tol=1e-7, shuffle=True,
                            hidden_layer_sizes=(40, 40, 40, 40, 8), verbose=True)
        clf_nn.fit(train_x, train_y)
        predicted_labels_nn[test] = clf_nn.predict(test_x)

        clf_rf = RandomForestClassifier(n_estimators=100, max_depth= 16, criterion="entropy", verbose=True)
        clf_rf.fit(train_x, train_y)
        predicted_labels_rf[test] = clf_rf.predict(test_x)

    score_value_dt  = accuracy_score(Y, predicted_labels_dt)
    score_value_knn = accuracy_score(Y, predicted_labels_knn1_dist)
    score_value_nn = accuracy_score(Y, predicted_labels_nn)
    score_value_rf = accuracy_score(Y, predicted_labels_rf)
    return score_value_dt, score_value_knn, score_value_nn, score_value_rf


generate_data = False
if generate_data:
    filename = '../reference data/collision_data_compiled.csv'
    my_data = np.genfromtxt(filename, delimiter=',')
    X = my_data[:, :-1]
    Y = my_data[:, -1]

    idx = np.random.choice(len(Y), len(Y))
    X = X[idx, :]
    Y = Y[idx]

    X = feature_engineering(X)
    X_scaled  = preprocessing.scale(X)

    noise_range = np.arange(0, 0.55, 0.05)
    n_reps = 5
    score_dt  = np.zeros([n_reps, len(noise_range)])
    score_knn = np.zeros([n_reps, len(noise_range)])
    score_nn = np.zeros([n_reps, len(noise_range)])
    score_rf = np.zeros([n_reps, len(noise_range)])

    for i in range(len(noise_range)):
        for j in range(n_reps):
            noise = np.random.normal(0, noise_range[i], X_scaled.shape)
            X_scaled_noisy = X_scaled + noise

            score_dt[j, i], score_knn[j, i], score_nn[j, i], score_rf[j, i] = get_cv_accuracy(X_scaled_noisy, Y)

    np.savetxt("../trained_models/accuracy_with_noise/scores_dt.csv", score_dt, delimiter=",")
    np.savetxt("../trained_models/accuracy_with_noise/scores_knn.csv", score_knn, delimiter=",")
    np.savetxt("../trained_models/accuracy_with_noise/scores_nn.csv", score_nn, delimiter=",")
    np.savetxt("../trained_models/accuracy_with_noise/scores_rf.csv", score_rf, delimiter=",")
    np.savetxt("../trained_models/accuracy_with_noise/noise_range.csv", noise_range, delimiter=",")
else:
    score_dt = np.genfromtxt("../trained_models/accuracy_with_noise/scores_dt.csv", delimiter=',')
    score_knn = np.genfromtxt("../trained_models/accuracy_with_noise/scores_knn.csv", delimiter=',')
    score_nn = np.genfromtxt("../trained_models/accuracy_with_noise/scores_nn.csv", delimiter=',')
    score_rf = np.genfromtxt("../trained_models/accuracy_with_noise/scores_rf.csv", delimiter=',')
    noise_range = np.genfromtxt("../trained_models/accuracy_with_noise/noise_range.csv", delimiter=',')

score_dt_mean = np.average(score_dt, 0)
score_knn_mean = np.average(score_knn, 0)
score_rf_mean = np.average(score_rf, 0)
score_nn_mean = np.average(score_nn, 0)

score_dt_std = np.std(score_dt, 0)
score_knn_std = np.std(score_knn, 0)
score_rf_std = np.std(score_rf, 0)
score_nn_std = np.std(score_nn, 0)

plt.figure()
plt.errorbar(noise_range, score_dt_mean, 2*score_dt_std, color='b', label='DT')
plt.errorbar(noise_range, score_knn_mean, 2*score_knn_std, color='g', label='k-NN')
plt.errorbar(noise_range, score_nn_mean, 2*score_nn_std, color='r', label='NN')
plt.errorbar(noise_range, score_rf_mean, 2*score_rf_std, color='m', label='RF')
plt.legend()
plt.grid()
plt.ylim(0.25, 1)
plt.ylabel('Accuracy')
plt.xlabel('Noise magnitude (n)')
plt.savefig('../figures/accuracy_with_noise.png')
plt.show()

ka = 10