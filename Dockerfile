# Base image
FROM python:3

# Author information
MAINTAINER vasilii.mosin@skoltech.ru

# Set a working directory
WORKDIR workspace

# Install latex.
RUN apt-get update
RUN apt-get --no-install-recommends install -y texlive
RUN apt-get --no-install-recommends install -y texlive-latex-extra
RUN apt-get install -y biber

# Install necessary libraries
RUN pip install numpy matplotlib scipy
RUN apt-get install -y gdal-bin libgdal-dev
RUN pip install rasterio

# Add necessary files. Good practice to do it at the end
# in order to avoid reinstallation of dependencies when files change
ADD code ./code
ADD data ./data
ADD latex ./latex
ADD run.sh ./

# Make run.sh executable
RUN chmod +x run.sh

# /example/results contents will be shared with the host
# if -v option used with "docker run" command
VOLUME /workspace/report

CMD ./run.sh
