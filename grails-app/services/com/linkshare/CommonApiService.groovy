package com.linkshare

import grails.transaction.Transactional
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class CommonApiService {

    File uploadFile(CommonsMultipartFile rawFile,String filesPath) {
        StringBuilder filePath = new StringBuilder(filesPath)
                .append(File.separator)
                .append(UUID.randomUUID().toString().replaceAll("-", "").substring(1,10))
                .append(rawFile?.originalFilename);
        File file = new File(filePath.toString());
        file.bytes = rawFile.bytes;
        return file;
    }
}
