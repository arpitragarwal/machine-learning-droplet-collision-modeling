import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import StratifiedKFold
from sklearn import tree, preprocessing
from sklearn.metrics import confusion_matrix, accuracy_score
from neural_network import neural_network
from decision_tree import decision_tree, random_forest
from sklearn.naive_bayes import GaussianNB, BernoulliNB, MultinomialNB
from feature_engineering import feature_engineering
from k_nn import k_nn
from support_vec import support_vec
from scipy.stats import mode
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import cross_val_score
from sklearn.externals.joblib import dump, load
from sklearn.ensemble import AdaBoostClassifier
from sklearn.utils import shuffle

filename = '../reference data/collision_data_compiled.csv'
my_data = np.genfromtxt(filename, delimiter=',')
X = my_data[:, :-1]
Y = my_data[:, -1]

idx = np.random.choice(len(Y), len(Y))
X = X[idx, :]
Y = Y[idx]

#X = feature_engineering(X)

X_scaled = X
X_scaled = preprocessing.scale(X)



if 0:
    np.savetxt("../trained_models/y_values.csv", Y, delimiter=",")
    score_dt, predicted_labels_dt = decision_tree(X_scaled, Y)
else:
    clf_dt = load('../trained_models/decision_tree.joblib')
    predicted_labels_dt = np.genfromtxt("../trained_models/predicted_labels_decision_tree.csv", delimiter=',')
    Y_values = np.genfromtxt("../trained_models/y_values.csv", delimiter=',')
    score_dt = accuracy_score(Y_values, predicted_labels_dt)

if 0:
    np.savetxt("../trained_models/y_values.csv", Y, delimiter=",")
    score_rand_forest, predicted_labels_rand_forest = random_forest(X_scaled, Y)
else:
    clf_rand_forest = load('../trained_models/random_forest.joblib')
    predicted_labels_rand_forest = np.genfromtxt("../trained_models/predicted_labels_random_forest.csv", delimiter=',')
    Y_values = np.genfromtxt("../trained_models/y_values.csv", delimiter=',')
    score_rand_forest = accuracy_score(Y_values, predicted_labels_rand_forest)

if 0:
    np.savetxt("../trained_models/y_values.csv", Y, delimiter=",")
    score_neural, predicted_labels_neural = neural_network(X_scaled, Y)
else:
    predicted_labels_neural = np.genfromtxt("../trained_models/predicted_labels_neural_network.csv", delimiter=',')
    Y_values = np.genfromtxt("../trained_models/y_values.csv", delimiter=',')
    score_neural = accuracy_score(Y_values, predicted_labels_neural)

if 0:
    np.savetxt("../trained_models/y_values.csv", Y, delimiter=",")
    score_knn, predicted_labels_knn = k_nn(X_scaled, Y)
else:
    predicted_labels_knn = np.genfromtxt("../trained_models/predicted_labels_knn.csv", delimiter=',')
    Y_values = np.genfromtxt("../trained_models/y_values.csv", delimiter=',')
    score_knn = accuracy_score(Y_values, predicted_labels_knn)

score_svm_rbf, predicted_labels_svm_rbf = support_vec(X_scaled, Y, kernel_type='rbf')
score_svm_sig, predicted_labels_svm_sig = support_vec(X_scaled, Y, kernel_type='sigmoid')
score_svm_pol, predicted_labels_svm_pol = support_vec(X_scaled, Y, kernel_type='poly')
score_svm_lin, predicted_labels_svm_lin = support_vec(X_scaled, Y, kernel_type='linear')

clf_gaus = GaussianNB()
clf_gaus.fit(X_scaled, Y)
predicted_labels_gaus = clf_gaus.predict(X_scaled)
score_gaus = accuracy_score(predicted_labels_gaus, Y)

clf_bern = BernoulliNB()
clf_bern.fit(X_scaled, Y)
predicted_labels_bern = clf_bern.predict(X_scaled)
score_bern = accuracy_score(predicted_labels_bern, Y)

if 0:
    print('Building ADA boost classifiers...')
    clf_ADA = AdaBoostClassifier(n_estimators=1000)
    scores_ada = cross_val_score(clf_ADA, X_scaled, Y, cv=10)

predicted_labels_all = np.array([predicted_labels_svm_rbf,
                                 predicted_labels_rand_forest,
                                 predicted_labels_knn,
                                 predicted_labels_neural,
                                 ])
predicted_labels_ensemble = mode(predicted_labels_all, 0).mode
score_ensemble = accuracy_score(np.transpose(predicted_labels_ensemble), Y)

score_physics_model = 0.4333
all_scores = np.array([score_physics_model,
                       score_rand_forest,
                       score_dt,
                       score_knn,
                       score_neural,
                       score_svm_rbf,
                       score_ensemble,
                       max(score_bern, score_gaus),
                       ])
np.savetxt("../trained_models/scores_all.csv", all_scores, delimiter=",")
import make_plots
i = 10