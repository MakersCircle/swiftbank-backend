# Use an official Python runtime as the base image
FROM python:3.10.12-buster

# Set the working directory in the container
WORKDIR /opt/project

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN set -xe \
    && apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && pip install virtualenvwrapper poetry==1.8.3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy and install Python dependencies
COPY ["poetry.lock", "pyproject.toml", "./"]
RUN poetry install --no-root

# Copy the entire project
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# Run the server
CMD ["poetry", "run", "python", "-m", "swiftbank.manage", "runserver", "0.0.0.0:8000"]
