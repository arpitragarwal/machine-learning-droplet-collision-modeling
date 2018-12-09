from sklearn.svm import SVC
import matplotlib.pyplot as plt
import numpy as np
from sklearn.model_selection import StratifiedKFold
from sklearn.metrics import confusion_matrix, accuracy_score

def support_vec(X, Y):
    print("Building SVMs...")
    skf = StratifiedKFold(n_splits=10, shuffle=True )
    predicted_labels_svm = -1 * np.ones(len(X))
    for train, test in skf.split(X, Y):
        train_x = X[train, :]
        train_y = Y[train]
        clf = SVC(gamma='auto')
        clf.fit(train_x, train_y)
        predicted_labels_svm[test] = clf.predict(X[test, :])
    score = accuracy_score(predicted_labels_svm, Y)
    return score, predicted_labels_svm
