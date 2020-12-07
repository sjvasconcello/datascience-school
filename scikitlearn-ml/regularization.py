import sklearn
import pandas as pd


from sklearn.linear_model import LinearRegression
from sklearn.linear_model import Lasso
from sklearn.linear_model import Ridge

from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error

if __name__ == '__main__':
    dataset = pd.read_csv("./data/whr2017.csv")
    print("\n")
    print("="*32)

    X = dataset[["gdp", "family", "lifexp", "freedom",
                 "corruption", "generosity", "dystopia"]]
    y = dataset[["score"]]

    # print(X.shape, y.shape)

    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.25, random_state=42)

    modelLinear = LinearRegression().fit(X_train, y_train)
    y_predict_linear = modelLinear.predict(X_test)

    modelLasso = Lasso(alpha=0.02).fit(X_train, y_train)
    y_predict_lasso = modelLasso.predict(X_test)

    modelRidge = Ridge(alpha=1).fit(X_train, y_train)
    y_predict_ridge = modelRidge.predict(X_test)

    linear_loss = mean_squared_error(y_test, y_predict_linear)
    lasso_loss = mean_squared_error(y_test, y_predict_lasso)
    ridge_loss = mean_squared_error(y_test, y_predict_ridge)

    data = {"Linear Loss": float(linear_loss), "Lasso Loss": float(
        lasso_loss), "Ridge Loss": float(ridge_loss)}
    print(pd.DataFrame(data, index=["Values"]).T)

    print("="*32)
    print(pd.DataFrame({"Coef Lasso": modelLasso.coef_,
                        "Coef Ridge": modelRidge.coef_[0]}, index= ["gdp", "family", "lifexp", "freedom",
                 "corruption", "generosity", "dystopia"]))
