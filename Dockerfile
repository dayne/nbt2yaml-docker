FROM python

RUN pip install nbt2yaml

ENTRYPOINT ["nbt2yaml"]
