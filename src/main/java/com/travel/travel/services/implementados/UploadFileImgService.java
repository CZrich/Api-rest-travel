package com.travel.travel.services.implementados;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.travel.travel.services.interfaces.UploadFileService;

@Slf4j
@Service
public class UploadFileImgService implements UploadFileService {
    // Construye la ruta absoluta hacia la carpeta 'uploads' en la raíz del proyecto
    private final static String UPLOADS_FOLDER = System.getProperty("user.dir") + File.separator + "uploads";
    @Autowired
     private  ServicioImplementado servicioImplementado;
    @Override
    public Resource load(String filename) throws MalformedURLException {

        Path path = getPath(filename);
        Resource resource = new UrlResource(path.toUri());

        if (!resource.exists() || !resource.isReadable()) {
            throw new RuntimeException("Error loading image: " + path.toString());
        }

        return resource;
    }

    @Override
    public String copy(MultipartFile file) throws IOException {
        String uniqueFilename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        Path rootPath = getPath(uniqueFilename);

        // Crea la carpeta si no existe
        File directory = new File(UPLOADS_FOLDER);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        Files.copy(file.getInputStream(), rootPath, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        return uniqueFilename;
    }



    @Override
    public boolean delete(String filename) {

        Path rootPath = getPath(filename);
        File file = rootPath.toFile();

        if (file.exists() && file.canRead()) {
            return file.delete();
        }

        return false;
    }

   /* public Path getPath(String filename) {

        return Paths.get(UPLOADS_FOLDER).resolve(filename).toAbsolutePath();
    }*/
   public Path getPath(String filename) {
       // Resolvemos la ruta absoluta
       return Paths.get(UPLOADS_FOLDER).resolve(filename).toAbsolutePath();
   }



}
