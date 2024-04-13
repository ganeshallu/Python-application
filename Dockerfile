# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Python script into the container
COPY calculator.py .

# Install tkinter (required for running Tkinter applications)
RUN apt-get update && apt-get install -y python3-tk

# Run the Python script when the container launches
CMD ["python", "calculator.py"]
