FROM python:3.10.7

RUN useradd -u 1000 -ms /bin/bash dont_user

# Set the working directory
WORKDIR /app

# Change permissions of /app directory
RUN chown dont_user:dont_user /app

# Copy requirements file to the container
COPY requirements.txt .


USER dont_user

# Create a Python virtual environment
# USER root
RUN python -m venv env
USER dont_user
RUN /bin/bash -c "source env/bin/activate"

# RUN . env/bin/activate
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r ./requirements.txt


COPY . .
# RUN pip install -r ./requirements.txt

# CMD ["python3", "./app/app.py"]