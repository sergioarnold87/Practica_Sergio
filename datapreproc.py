    #!/usr/bin/env python3
    # -*- coding: utf-8 -*-
    """
    Created on Thu Mar 18 10:34:19 2021
    
    @author: sergio
    """
    
    import numpy as np
    import matplotlib.pyplot as plt
    import pandas as pd
    
    ## IMPORTAR EL DATASET
    
    dataset = pd.read_csv("/home/sergio/Documentos/GitHub/machinelearning-az/datasets/Part 1 - Data Preprocessing/Section 2 -------------------- Part 1 - Data Preprocessing --------------------/Data.csv")
    
    X = dataset.iloc[:, :-1].values
    y = dataset.iloc[:, 3].values
    
    ## CODIFICAR DATOS CATEGÓRICOS
    from sklearn.preprocessing import LabelEncoder, OneHotEncoder
    from sklearn.compose import ColumnTransformer
    
    labelencoder_X = LabelEncoder()
    X[:, 0] = labelencoder_X.fit_transform(X[:, 0])
    
    ct = ColumnTransformer(
        [('one_hot_encoder', OneHotEncoder(categories = 'auto'), [0])],  #El numero de columna a ser transformado
        remainder='passthrough'
        )
    
    X = np.array(ct.fit_transform(X), dtype=np.float)
    labelencoder_y = LabelEncoder()
    y = labelencoder_y.fit_transform(y)
    
    ### DIVIDIR EL DATA SET EN CONJUNTO DE ENTRENAMIENTO Y CONJUNTO DE TESTING 
    from sklearn.model_selection import train_test_split
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state=0)
    
    #ESCALADO DE VARIABLES 
    
    from sklearn.preprocessing import StandardScaler
    sc_X = StandardScaler()
    X_train = sc_X.fit_transform(X_train)
    X_test = sc_X.transform(X_test)
    
    ## TRATAMIENTO DE LOS NAs
    
    from sklearn.impute import SimpleImputer
    
    imputer = SimpleImputer(missing_values = np.nan, strategy="mean", verbose = 0)
    imputer = imputer.fit(X[:, 1:3])
    X[:, 1:3] = imputer.transform(X[:, 1:3])
    
    ## CODIFICAR DATOS CATEGORICOS
    
    from sklearn.preprocessing import LabelEncoder, OneHotEncoder
    from sklearn.compose import ColumnTransformer
    
    labelencoder_X = LabelEncoder()
    X[:, 0] = labelencoder_X.fit_transform(X[:, 0])
    
    ct = ColumnTransformer(
            [('one_hot_encoder', OneHotEncoder(categories='auto'), [0])],
            remainder='passthrough'
        )
    
    X = np.array(ct.fit_transform(X), dtype = np.float)
    labelencoder_y = LabelEncoder()
    y = labelencoder_y.fit_transform(y)
    
    #DIVIDIR EL DATASET EN CONJUNTO DE ENTRENAMIENTO Y EN CONJUNTO DE TESTING
    
    from sklearn.model_selection import  train_test_split
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)
    
    # ESCALADO DE VARIABLES 
    from sklearn.preprocessing import StandardScaler
    sc_X = StandardScaler()
    X_train = sc_X.fit_transform(X_train)
    X_test = sc_X.transform(X_test)










