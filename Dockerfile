FROM python:3.7.3-stretch

LABEL maintainer="jgeof.dev@gmail.com"

# Working Directory
WORKDIR /app

# Copy source code to Working Directory
COPY . /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade setuptools wheel --use-pep517 pip &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Expose port 80
EXPOSE 80

# Run app.py at container launch
CMD ["python", "app.py"]