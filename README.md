 This *docker* branch is developed to make my research reproducible.

You can build the image using Dockerfile.  
Alternatively, you can simply download the image from Docker Hub. Use the following command for this:
```(sudo) docker pull mosin26/research```. Wait some time while all the image will be downloaded.

To run the container use the following command: ```(sudo) docker run -v ~/Desktop/:/workspace/report --rm --name research mosin26/research```.
It should execute the code and output the generated report in PDF format to the ```~/Desktop/```. You can specify the exact path you
want to output the report instead of ```~/Desktop/```.
