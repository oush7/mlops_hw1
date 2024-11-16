FROM python:3.10

RUN pip install --upgrade pip setuptools wheel build pybind11 numpy

RUN apt-get update && apt-get install -y \
    libgtest-dev \
    cmake 

# Копируем код проекта в контейнер
WORKDIR /app
COPY . .

# Собираем пакет в .whl файл
RUN make all
RUN python3 -m build

# Устанавливаем собранный .whl файл
RUN pip install dist/*.whl

# Запускаем контейнер (можно указать команду запуска приложения, если требуется)
CMD ["python3", "perf.py"]
