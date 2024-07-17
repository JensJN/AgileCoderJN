# base image
FROM python:3

# set workdir for caching
WORKDIR /docker
COPY ./agilecoder ./agilecoder
COPY ./setup.py .
#RUN pip install --no-index --upgrade -e .
RUN pip install -e .

###RUN pip install -e AgileCoder
###RUN pip install --no-cache-dir --upgrade -e AgileCoder
#RUN pip install --no-cache-dir --upgrade AgileCoder

RUN pip install --no-cache-dir --upgrade tree-sitter tree-sitter-python

# This doesn't work as passing the key is tricky here / don't want to bake it in
# REQUIRES .env to contain API key:
    # export API_KEY="$(cat /mnt/e/Dev/AP.txt)"

#CMD ["agilecoder", "--name", "testJN", "--model", "CLAUDE", "--task", "create an application with 1) a fastapi backend that serves a graphql endpoint and 2) a react native web frontend that consumes the graphql endpoint. Create a simple test page with a button that fetches helloworld from the backend when pressed."]

# Instead, keep running and use docker exec
ENTRYPOINT ["tail", "-f", "/dev/null"]

# then run in terminal:
    # export API_KEY="$(cat /mnt/e/Dev/AP.txt)"
    # export API_KEY="$(cat /mnt/e/Dev/DS.txt)"
    # docker build -t image_agilecoder .
    # docker run -td --rm --name container_agilecoder --volume $(pwd)/agilecoderapp:/~ image_agilecoder
    # docker exec -it container_agilecoder export API_KEY="$(cat /mnt/e/Dev/AP.txt)"
    # docker exec -it container_agilecoder agilecoder --name testJN --model CLAUDE --task "Create an application with 1) a fastapi backend that serves a graphql endpoint and 2) a react native web frontend that consumes the graphql endpoint. Create a simple test page with a button that fetches helloworld from the backend when pressed."
    # docker stop container_agilecoder
    # agilecoder --name testJN --model CLAUDE --task "Create an application with 1) a fastapi backend that serves a graphql endpoint and 2) a react native web frontend that consumes the graphql endpoint. Create a simple test page with a button that fetches helloworld from the backend when pressed."
