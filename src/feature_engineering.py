import numpy as np

def feature_engineering(X):
    X[X[:, 1] < 0, 1] = 0
    xi   = 0.5 * X[:, 1] * (1 + X[:, 2])
    eta1 = 2 * (1 - xi)**2 * (1 - xi**2)**0.5 - 1
    eta2 = 2 * (X[:, 2] - xi)**2 * (X[:, 2]**2 - xi**2)**0.5 - X[:, 2]**3
    eta2[np.where(np.isnan(eta2))] = 0
    numer = 3 * (7 * (1 + X[:, 2]**3)**(2/3) - 4*(1 + X[:, 2]**2)) * X[:, 2] * (1 + X[:, 2]**3)**2
    denom = X[:, 2]**6 * eta1 + eta2
    We_c  = numer/denom
    X = np.append(X, np.zeros([len(X), 1]), 1)
    n_columns = len(X[1, :])
    X[:, n_columns - 1] = X[:, 0] - We_c #this represents C2

    gamma = 1/X[:, 2]
    f_gamma = gamma**3 - 2.4 * gamma**2 + 2.7 * gamma
    e_coal = np.minimum(np.ones(len(f_gamma)), (2.4 * f_gamma)/X[:, 0])
    e_coal[np.where(e_coal < 0)] = 0
    X = np.append(X, np.zeros([len(X), 1]), 1)
    n_columns = len(X[1, :])
    X[:, n_columns - 1] = (1.0 * np.sqrt(e_coal)) - X[:, 1] # represents C3

    tau = (1 - X[:, 1]) * (1 + X[:, 2])
    coll_condition = 0.5 * tau
    xi_1 = np.zeros([len(tau), 1])
    for i in range(len(tau)):
        if (coll_condition[i] > 0.5):
            xi_1[i] = 1.0 - 0.25 * (2.0 - tau[i])**2 * (1 + tau[i])
        else:
            xi_1[i] = 0.25 * tau[i]**2 * (3.0 - tau[i])

    numer2 = X[:, 2] * (1 + X[:, 2]**2) * (4*3.351 - 12)
    denom2 = np.transpose(xi_1) * (np.cos(np.arcsin(X[:, 1])))**2
    denom2[np.where(denom2<1e-6)] = 1e-6
    We_c2 = numer2/denom2
    X = np.append(X, np.zeros([len(X), 1]), 1)
    n_columns = len(X[1, :])
    We_c2[np.where(np.isinf(We_c2))] = 1e6
    X[:, n_columns - 1] = X[:, 0] - We_c2 # represents C1

    return X
