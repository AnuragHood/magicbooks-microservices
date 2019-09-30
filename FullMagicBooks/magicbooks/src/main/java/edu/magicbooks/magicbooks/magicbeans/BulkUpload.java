package edu.magicbooks.magicbooks.magicbeans;


import javax.persistence.Transient;
import java.io.File;

public class BulkUpload {
    @Transient
    private File bulkFile;

    public File getBulkFile() {
        return bulkFile;
    }

    public void setBulkFile(File bulkFile) {
        this.bulkFile = bulkFile;
    }
}
