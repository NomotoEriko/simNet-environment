FROM pytorch/pytorch:0.4.1-cuda9-cudnn7-devel

RUN apt-get update && apt-get install -y openjdk-8-jdk ant && apt-get clean
RUN git clone https://github.com/lancopku/simNet.git
RUN git clone -b simNet https://github.com/OnizukaLab/coco-caption.git coco
RUN 2to3 -w simNet/
ENV PYTHONPATH /workspace/
RUN pip install Cython
RUN pip install nltk matplotlib scikit-image
COPY setup.py /
RUN python /setup.py
RUN chmod -R 777 /workspace/
# RUN apt-get update && apt-get install -y vim
