# slatedoc
Repository that transforms a swagger and/or markdown folder into a slate documentation (integrates also openapi/swagger files)

## Generate markdown from swagger

Put your swagger files in a directory inside the projects folder (Example : projects/myslateproject)

Define the **PROJECT_NAME** env variable with the name of the project (in our case it's myslateproject)

Use the ```make build``` command to generate the output

You can also use ```PROJECT_NAME=myslateproject make build```

## Generate Slate site from markdown

Use the ```make start``` command to start the container

You can also use ```PROJECT_NAME=myslateproject make start```

This will get all the markdown available in the specified project and compile them  into the slate site.

## Stop the application

Use the ```make stop``` command to stop the container