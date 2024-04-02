FROM python:3.8-slim-buster

WORKDIR /vcf2maf-lite

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .
CMD ["python3", "vcf2maf-lite.py"]