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

WORKDIR /~

# This doesn't work as passing the key is tricky here / don't want to bake it in
# REQUIRES .env to contain API key:
    # export API_KEY="$(cat /mnt/e/Dev/AP.txt)"

#CMD ["agilecoder", "--name", "testJN", "--model", "CLAUDE", "--task", "create an application with 1) a fastapi backend that serves a graphql endpoint and 2) a react native web frontend that consumes the graphql endpoint. Create a simple test page with a button that fetches helloworld from the backend when pressed."]

# Instead, keep running and use docker exec
ENTRYPOINT ["tail", "-f", "/dev/null"]

# then run in terminal:
    # export API_KEY_PATH="/mnt/e/Dev/VThrkm.json"
    # docker build -t image_agilecoder .
    # docker run -td --rm --name container_agilecoder --env API_KEY_PATH=$API_KEY_PATH --volume $(pwd)/agilecoderapp:/~ --volume $API_KEY_PATH:$API_KEY_PATH image_agilecoder
    # docker exec -it container_agilecoder agilecoder --name testJN --model CLAUDE --task "Create an application with 1) a fastapi backend that serves a graphql endpoint and 2) a react native web frontend that consumes the graphql endpoint. Create a simple test page with a button that fetches helloworld from the backend when pressed."
    # docker stop container_agilecoder
