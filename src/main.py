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

filename = '../reference data/collision_data_compiled.csv'
my_data = np.genfromtxt(filename, delimiter=',')
X = my_data[:, :-1]
Y = my_data[:, -1]

X = feature_engineering(X)

X_scaled = X
X_scaled = preprocessing.scale(X)

score_dt = decision_tree(X_scaled, Y)
#score_neural, predicted_labels_neural = neural_network(X_scaled, Y)

clf_gaus = GaussianNB()
clf_gaus.fit(X_scaled, Y)
predicted_labels_gaus = clf_gaus.predict(X_scaled)
score_gaus = accuracy_score(predicted_labels_gaus, Y)

clf_bern = BernoulliNB()
clf_bern.fit(X_scaled, Y)
predicted_labels_bern = clf_bern.predict(X_scaled)
score_bern = accuracy_score(predicted_labels_bern, Y)

score_rand_forest = random_forest(X_scaled, Y)
score_knn = k_nn(X_scaled, Y)
score_svm, predicted_labels_svm = support_vec(X_scaled, Y)

predicted_labels_all = np.array([predicted_labels_bern, predicted_labels_gaus, predicted_labels_svm])
predicted_labels_ensemble = mode(predicted_labels_all, 0).mode
score_ensemble = accuracy_score(np.transpose(predicted_labels_ensemble), Y)

i = 10