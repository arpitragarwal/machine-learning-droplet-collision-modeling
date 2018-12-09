from sklearn.metrics import confusion_matrix, accuracy_score
from sklearn.model_selection import StratifiedKFold
from sklearn.neural_network import MLPClassifier
import matplotlib.pyplot as plt
import numpy as np

def neural_network(X_scaled, Y):
    print("Building neural networks...")
    score_value = np.array([])
    #n_iter_values = np.array([10, 100, 200, 500, 1000, 2000])
    n_iter_values = np.array([20, 40, 80, 160, 320, 640])
    for n_iter in n_iter_values:
        skf = StratifiedKFold(n_splits=10, shuffle=True )
        predicted_labels = -1 * np.ones(len(X_scaled))
        for train, test in skf.split(X_scaled, Y):
            train_x = X_scaled[train, :]
            train_y = Y[train]
            clf = MLPClassifier(solver='sgd', max_iter=n_iter, tol=1e-7, shuffle=True,
                                hidden_layer_sizes=(40, 40, 40, 40, 8), random_state=1, verbose=True)
            clf.fit(train_x, train_y)
            predicted_labels[test] = clf.predict(X_scaled[test, :])
        score_value = np.append(score_value, accuracy_score(Y, predicted_labels))

    plt.plot(n_iter_values, score_value, '-o')
    plt.ylim(0.4, 1)
    plt.grid()
    plt.xlabel('No. of iterations')
    plt.ylabel('Accuracy')
    plt.title('Accuracy with Neural Net')
    plt.show()
    return score_value[-1], predicted_labels