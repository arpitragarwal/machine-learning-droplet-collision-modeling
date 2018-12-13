import matplotlib.pyplot as plt
import numpy as np
from sklearn.neighbors import KNeighborsClassifier, RadiusNeighborsClassifier
from sklearn.model_selection import StratifiedKFold
from sklearn.metrics import confusion_matrix, accuracy_score

def k_nn(X_scaled, Y):
    print("Working on k-nns...")
    no_neighbors = 2**np.arange(0, 9, 1)
    score_knn1 = np.array([])
    score_knn2 = np.array([])
    score_knn1_dist = np.array([])
    score_knn2_dist = np.array([])
    for no_neigh in no_neighbors:
        skf = StratifiedKFold(n_splits=10, shuffle=True )
        predicted_labels_knn1 = -1 * np.ones(len(X_scaled))
        predicted_labels_knn2 = -1 * np.ones(len(X_scaled))
        predicted_labels_knn1_dist = -1 * np.ones(len(X_scaled))
        predicted_labels_knn2_dist = -1 * np.ones(len(X_scaled))
        for train, test in skf.split(X_scaled, Y):
            train_x = X_scaled[train, :]
            train_y = Y[train]

            neigh = KNeighborsClassifier(n_neighbors=no_neigh, weights='uniform', p=1)
            neigh.fit(train_x, train_y)
            predicted_labels_knn1[test] = neigh.predict(X_scaled[test, :])

            neigh = KNeighborsClassifier(n_neighbors=no_neigh, weights='uniform', p=2)
            neigh.fit(train_x, train_y)
            predicted_labels_knn2[test] = neigh.predict(X_scaled[test, :])

            neigh = KNeighborsClassifier(n_neighbors=no_neigh, weights='distance', p=1)
            neigh.fit(train_x, train_y)
            predicted_labels_knn1_dist[test] = neigh.predict(X_scaled[test, :])

            neigh = KNeighborsClassifier(n_neighbors=no_neigh, weights='distance', p=2)
            neigh.fit(train_x, train_y)
            predicted_labels_knn2_dist[test] = neigh.predict(X_scaled[test, :])

        if len(score_knn1_dist):
            if (accuracy_score(predicted_labels_knn1_dist, Y) > max(score_knn1_dist)):
                predicted_labels_knn1_dist_best = predicted_labels_knn1_dist
                np.savetxt("../trained_models/predicted_labels_knn.csv",
                           predicted_labels_knn1_dist, fmt='%i', delimiter=",")

        score_knn1 = np.append(score_knn1, accuracy_score(predicted_labels_knn1, Y))
        score_knn2 = np.append(score_knn2, accuracy_score(predicted_labels_knn2, Y))
        score_knn1_dist = np.append(score_knn1_dist, accuracy_score(predicted_labels_knn1_dist, Y))
        score_knn2_dist = np.append(score_knn2_dist, accuracy_score(predicted_labels_knn2_dist, Y))

    np.savetxt("../trained_models/scores_knn1.csv", score_knn1, delimiter=",")
    np.savetxt("../trained_models/scores_knn2.csv", score_knn2, delimiter=",")
    np.savetxt("../trained_models/scores_knn1_dist.csv", score_knn1_dist, delimiter=",")
    np.savetxt("../trained_models/scores_knn2_dist.csv", score_knn2_dist, delimiter=",")

    plt.plot(no_neighbors, score_knn1, '-o', label='L1, uniform')
    plt.plot(no_neighbors, score_knn2, '-o', label='L2, uniform')
    plt.plot(no_neighbors, score_knn1_dist, '--o', label='L1, distance')
    plt.plot(no_neighbors, score_knn2_dist, '--o', label='L2, distance')
    plt.ylim(0.6, 1)
    #plt.xlim(0, max(no_neighbors))
    plt.xscale("log")
    plt.grid()
    plt.xlabel('k value')
    plt.ylabel('Accuracy')
    plt.title('Accuracy with k-NN')
    plt.legend()
    plt.savefig('../figures/accuracy_knn.png')
    plt.show()

    return max(score_knn1_dist), predicted_labels_knn1_dist_best
