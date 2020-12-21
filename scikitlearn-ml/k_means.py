import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.cluster import MiniBatchKMeans

if __name__ == '__main__':
    dataset = pd.read_csv("./data/candy.csv")
    print(dataset.head())

    X = dataset.drop("competitorname", axis=1)

    kmeans = MiniBatchKMeans(n_clusters=4, batch_size=8).fit(X)
    print("Total de centros: ", len(kmeans.cluster_centers_))
    print("="*64)
    print(kmeans.predict(X))

    dataset["group"] = kmeans.predict(X)

    print(dataset)
    sns.color_palette("tab10")
    sns.color_palette("Spectral", as_cmap=True)
    sns.pairplot(dataset[['sugarpercent','pricepercent','winpercent','group']], hue = 'group', corner=True)
    plt.show()
    