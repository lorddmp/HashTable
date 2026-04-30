import matplotlib.pyplot as plt

for i in range (1,7):
    values = []
    with open(f'List_Sizes/list_sizes{i}.txt', 'r') as f:
        for line in f:
            values.append(float(line.strip()))

    x_axis = range(1, len(values) + 1)

    plt.bar(x_axis, values, width = 5)

    plt.title(f"Как слова разлились по спискам №{i}")
    plt.xlabel("Номер списка")
    plt.ylabel("Размер")
    plt.grid(axis='y', linestyle=':', alpha=0.7)

    plt.show()