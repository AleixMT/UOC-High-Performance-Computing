
def aggregate(name):
    results_fp = open(name + "_results.csv", "w+")
    argument_values = (1, 2, 3, 4)
    for argument_value in argument_values:
        with open(name + "_" + str(argument_value) + "_data.txt") as fp:
            current_values = []
            for line in fp.readlines():
                current_values.append(float(line.split("m")[1].split("s")[0]))
            average = sum(current_values) / len(current_values)
            accumulator = 0
            for current_value in current_values:
                accumulator += abs(average - current_value)
            standard_deviation = accumulator / len(current_values)

            results_fp.write(str(argument_value) + "\t" + str(average) + "\t" + str(standard_deviation)+ "\t" + str(standard_deviation) + "\n")


aggregate("mm")
aggregate("mm2")