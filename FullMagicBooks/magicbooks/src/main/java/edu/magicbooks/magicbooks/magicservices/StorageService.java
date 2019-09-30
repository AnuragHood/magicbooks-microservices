package edu.magicbooks.magicbooks.magicservices;

import edu.magicbooks.magicbooks.exceptions.StorageException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Service
public class StorageService {
    @Value("${upload.dir.location}")
    private String path;

    public String uploadFile(MultipartFile file, Long id, int i) {

        if (file.isEmpty()) {
            throw new StorageException("Failed to store empty file");
        }

        try {
            String fileName = "magicbooks_" + i + "_" + id;
            InputStream is = file.getInputStream();

            Files.copy(is, Paths.get(path + fileName), StandardCopyOption.REPLACE_EXISTING);
            return "/magicbooks/resources/images/" + fileName;
        } catch (IOException e) {

            String msg = String.format("Failed to store file", file.getName());

            throw new StorageException(msg, e);
        }

    }
}
