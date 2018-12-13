from matplotlib import pyplot as plt
import numpy as np

all_scores = np.genfromtxt("../trained_models/scores_all.csv", delimiter=',')

all_names = ['Physics Based',
             'Random Forest',
             'Decision Tree',
             'K-NN',
             'Neural Network',
             'SVM (RBF)',
             'Ensemble',
             'Naive Bayes'
             ]

colors =    ('r',
             'b',
             'b',
             'b',
             'b',
             'b',
             'b',
             'b'
            )

sorted_scores = np.sort(all_scores)
sorted_idx    = np.argsort(all_scores)
sorted_names = [all_names[i] for i in sorted_idx]
sorted_colors = [colors[i] for i in sorted_idx]

fig, ax = plt.subplots(1)
#ax.grid()
ax.yaxis.grid()
ax.set_axisbelow(True)
ax.bar(np.arange(len(all_scores)), sorted_scores, color=sorted_colors)
ax.set_xticks(np.arange(len(all_scores)))
ax.set_xticklabels(sorted_names, rotation=45)
plt.ylim(0.25, 1)
plt.ylabel('Accuracy')
plt.title('Accuracy with different models')
plt.tight_layout()
plt.savefig('../figures/accuracy_compilation.png')
plt.show()
