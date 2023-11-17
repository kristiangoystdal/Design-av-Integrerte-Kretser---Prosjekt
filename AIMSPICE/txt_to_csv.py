import csv
import os

# Example usage:
txt_path = "txt_Files"
output_path = "AIMSPICE/csv_Files"


def txt_to_csv(input_txt, output_csv, delimiter="\t"):
    with open(input_txt, "r") as txtfile, open(output_csv, "w", newline="") as csvfile:
        csvwriter = csv.writer(
            csvfile, delimiter=",", quotechar='"', quoting=csv.QUOTE_MINIMAL
        )
        for line in txtfile:
            values = line.strip().split(delimiter)
            csvwriter.writerow(values)


def convert_folder_txt_to_csv(
    input_folder=txt_path, output_folder=output_path, delimiter="\t"
):
    script_path = os.path.abspath(__file__)
    input_folder_path = os.path.join(os.path.dirname(script_path), input_folder)
    os.makedirs(output_folder, exist_ok=True)

    files = [f for f in os.listdir(input_folder_path)]

    for file in files:
        input_file_path = os.path.join(input_folder_path, file)
        output_file_path = os.path.join(output_folder, file.replace(".txt", ".csv"))

        txt_to_csv(input_file_path, output_file_path, delimiter)


convert_folder_txt_to_csv()
