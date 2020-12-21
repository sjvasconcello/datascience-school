# Library's
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.cluster import MeanShift


if __name__ == '__main__':

    dataset = pd.read_csv("./data/candy.csv")
    print(dataset.head())

    X = dataset.drop("competitorname", axis=1)

    meanshift = MeanShift().fit(X)

    print(meanshift.labels_)
    print("="*64)

    print(meanshift.cluster_centers_)

    dataset["meanshift"] = meanshift.labels_
    print("="*64)   

    print(dataset)
    sns.color_palette("tab10")
    sns.pairplot(dataset[['sugarpercent','pricepercent','winpercent','meanshift']], hue = 'meanshift', corner=True)
    plt.show()
    