import matplotlib.pyplot as plt
import csv


def plot(name, pictureName, title):
    time = []
    v_q = []
    v_d = []
    v_s = []
    v_r = []
    v_clk = []

    path = (
        "C:/Users/krisg/OneDrive - NTNU/2023 Høst/Design av integrete kretser/Prosjekt/Git Prosjekt/AIMSPICE/sus_plots/"
        + name
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
            time.append(float(row[0]))
            v_clk.append(float(row[1]))
            v_d.append(float(row[2]) + 1)
            v_q.append(float(row[3]) + 4)
            v_r.append(float(row[4]) + 3)
            v_s.append(float(row[5]) + 2)

    plt.plot(time, v_clk)
    plt.plot(time, v_d)
    plt.plot(time, v_r)
    plt.plot(time, v_s)
    plt.plot(time, v_q)

    clk_period = 20e-9
    max_time = max(time)
    clock_periods = round(max_time / clk_period)

    for i in range(clock_periods):
        plt.axvline(x=i * clk_period, alpha=0.3, color="b", linestyle="dotted")

    x_ticks = [i * clk_period for i in range(clock_periods)]
    x_labels = [str(i + 1) for i in range(clock_periods)]
    plt.xticks(x_ticks, x_labels)

    mid_clk = max(v_clk) / 2
    name_signal = ["CLK", "Data", "Set", "Reset", "Q"]
    y_ticks = [(mid_clk + i) for i in range(5)]
    y_labels = [name_signal[i] for i in range(5)]
    plt.yticks(y_ticks, y_labels)

    plt.xlabel("Clock Periods")
    plt.title(title)

    plt.savefig(pictureName)
    plt.clf()


filenames = [
    "ff0.csv",
    "ff27.csv",
    "ff70.csv",
    "fs0.csv",
    "fs27.csv",
    "fs70.csv",
    "sf0.csv",
    "sf27.csv",
    "sf70.csv",
    "ss0.csv",
    "ss27.csv",
    "ss70.csv",
    "tt0.csv",
    "tt27.csv",
    "tt70.csv",
]

picNames = [
    "FF_0",
    "FF_27",
    "FF_70",
    "FS_0",
    "FS_27",
    "FS_70",
    "SF_0",
    "SF_27",
    "SF_70",
    "SS_0",
    "SS_27",
    "SS_70",
    "TT_0",
    "TT_27",
    "TT_70",
]

titles = [
    "Corner: FF - Temperature: 0",
    "Corner: FF - Temperature: 27",
    "Corner: FF - Temperature: 70",
    "Corner: FS - Temperature: 0",
    "Corner: FS - Temperature: 27",
    "Corner: FS - Temperature: 70",
    "Corner: SF - Temperature: 0",
    "Corner: SF - Temperature: 27",
    "Corner: SF - Temperature: 70",
    "Corner: SS - Temperature: 0",
    "Corner: SS - Temperature: 27",
    "Corner: SS - Temperature: 70",
    "Corner: TT - Temperature: 0",
    "Corner: TT - Temperature: 27",
    "Corner: TT - Temperature: 70",
]

for i in range(len(filenames)):
    plot(filenames[i], picNames[i], titles[i])
print("Done")
