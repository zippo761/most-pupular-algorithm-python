cpdef input_digit():
    try:
        digit = 10000
        return digit
    except ValueError as exception:
        raise exception

cpdef init_data(n):
    matrix_for_iter = [
        [0 for i in range(n)] for j in range(n)
    ]  # создаю матрицу n*n и заполняю нулями
    return matrix_for_iter


cpdef run_matrix(number, matrix):
    cdef int k = 1  # заполняю матрицу числом 'K' увеличивая его на 1 после заполнения каждого элемента
    cdef int m = 0  # 4 байте для переменной счётчик итераций спирали, увеличиваю на 1 на каждом витке спирали

    while (
        k <= number * number
    ):  # внешний цикл с 4  циклами пока k не заполнит всю матрицу n*n
        "24 байта для переменной 'i'"
        for i in range(
            m, number - m
        ):  # цикл заполняет верхнюю сторону спирали - на каждой итерации сужаем границы цикла
            matrix[m][i] = k  # на 'm' с каждой стороны
            k += 1
        for i in range(
            m + 1, number - m
        ):  # цикл заполняет правую сторону спирали, границы зависят от m
            matrix[i][number - m - 1] = k
            k += 1
        for i in range(
            number - m - 2, m - 1, -1
        ):  # заполняею нижнюю сторону спирали - зависит от m
            matrix[number - m - 1][i] = k
            k += 1
        for i in range(
            number - 2 - m, m, -1
        ):  # цикл заполняет левую сторону спирали - зависит от m
            matrix[i][m] = k
            k += 1
        m += 1

    return matrix
