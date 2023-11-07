import csv  # Add this import statement to use the csv module
import matplotlib.pyplot as plt

i = []

path = (
    "C:/Users/krisg/OneDrive - NTNU/2023 Høst/Design av integrete kretser/Prosjekt/Design_av_Integrerte_Kretser__Prosjekt/AIMSPICE/"
    + "current.csv"
)
with open(
    path,
    "r",
) as csvfile:
    plots = csv.reader(csvfile, delimiter=",")

    # Skip the first 5 lines
    for _ in range(5):
        next(plots)

    for row in plots:
        i.append(float(row[0]))

# print(i)

average = sum(i) / len(i)
print(average)
plt.plot(i)
plt.show()
