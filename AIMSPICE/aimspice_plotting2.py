import matplotlib.pyplot as plt
import csv
import numpy as np

clk_period = 20e-9


def plot(name, pictureName, title):
    time = []
    q_time = []
    v_q = []
    v_d = []
    v_s = []
    v_r = []
    v_clk = []

    path = (
        "C:/Users/krisg/OneDrive - NTNU/2023 Høst/Design av integrete kretser/Prosjekt/Design_av_Integrerte_Kretser__Prosjekt/AIMSPICE/csv_Files/"
        + name
    )
    with open(
        path,
        "r",
    ) as csvfile:
        plots = csv.reader(csvfile, delimiter=",")

        # Skip the first line
        for _ in range(1):
            next(plots)

        for row in plots:
            time.append(float(row[0]))
            v_d.append(float(row[1]) + 3)
            v_clk.append(float(row[2]) + 4)
            v_s.append(float(row[3]) + 2)
            v_r.append(float(row[4]) + 1)
            current_time = float(row[0])
            if current_time > 2 * clk_period:
                q_time.append(current_time)
                v_q.append(float(row[5]))

    plt.plot(q_time, v_q, label=pictureName)

    max_time = max(time)
    clock_periods = round(max_time / clk_period)

    for i in range(clock_periods):
        plt.axvline(x=i * clk_period, alpha=0.3, color="b", linestyle="dotted")

    x_ticks = [i * clk_period for i in range(clock_periods)]
    x_labels = [str("") for i in range(clock_periods)]
    plt.xticks(x_ticks, x_labels)

    # V_DD = 0.85
    # mid_clk = V_DD / 2
    # name_signal = ["Q", "Reset", "Set", "Data", "CLK"]
    # y_ticks = [(mid_clk + i) for i in range(5)]
    # y_labels = [name_signal[i] for i in range(5)]
    # plt.yticks(y_ticks, y_labels)

    # plt.xlabel("Clock Periods")
    # plt.title(title)

    # # Shaded Area
    # x = np.linspace(0, 2 * clk_period, 10)
    # y_min = min(v_q)
    # y_max = max(v_q)
    # plt.fill_between(x, y_min, y_max, color="gray", alpha=0.3, label="Shaded Area")


filenames = [
    "ff_0.csv",
    "ff_27.csv",
    "ff_70.csv",
    "fs_0.csv",
    "fs_27.csv",
    "fs_70.csv",
    "sf_0.csv",
    "sf_27.csv",
    "sf_70.csv",
    "ss_0.csv",
    "ss_27.csv",
    "ss_70.csv",
    "tt_0.csv",
    "tt_27.csv",
    "tt_70.csv",
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

for i in range(len(filenames) - 3, len(filenames)):
    plot(filenames[i], picNames[i], titles[i])
plt.xlim(3.5 * clk_period, 4.5 * clk_period)
plt.legend()
plt.savefig("Corner")
# plt.show()

for i in range(1, len(filenames), 3):
    plot(filenames[i], picNames[i], titles[i])
plt.xlim(3.5 * clk_period, 4.5 * clk_period)
plt.legend()
plt.savefig("Temperatur")
# plt.show()
