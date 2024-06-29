# sana-application

The steps to run the application are as follows:

1. Download the repo, there are 3 folders. SanaApplication where is the .net solution. sana-application the ReactJS application. And finally the DB folder where is the DB schema along with the script to create it.
2. Create the DB using the script in DB folder.
3. Open the .net solution and modify the ConnectionStrings:DefaultConnection property.
4. And finally open in console the san-application folder and execute the command ''npm run dev".

Note: if for some reason the ports where each of the applications is launched needs to be changed, then we will have to modify the CORS in the API or the HTTP requests in the React application respectively.
