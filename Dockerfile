FROM python:3.12.3 as builder

WORKDIR /app

RUN pip install poetry
RUN poetry config virtualenvs.create false

COPY pyproject.toml .
COPY poetry.lock .

RUN poetry install

RUN python -m spacy download de_core_news_sm

COPY . . 


FROM python:3.12.3

WORKDIR /app
ENV STREAMLIT_SERVER_PORT=8000
EXPOSE 8000

COPY --from=builder /usr/local/bin/streamlit /usr/local/bin/streamlit
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages

COPY --from=builder /app/_streamlit_app . 

CMD [ "python", "-m", "streamlit", "run", "./sprache-vereinfachen.py"]

