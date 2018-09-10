FROM bamos/openface:latest

RUN python --version
RUN apt-add-repository ppa:jonathonf/python-2.7 -y
RUN apt-get update && apt-get install -y python2.7
RUN apt-get remove -y ipython
RUN pip install --upgrade pip setuptools
RUN python --version

WORKDIR /aiuoa
RUN chmod -R a+rwx /aiuoa
RUN pip install tflearn pathlib tensorflow jupyter scikit-learn face_recognition
ENV PYTHONPATH "${PYTHONPATH}:/aiuoa"
EXPOSE 8888
EXPOSE 6006

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/aiuoa/notebooks --ip 0.0.0.0 --no-browser --allow-root"]
