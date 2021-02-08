package com.mp;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.util.Arrays;
 
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;
 
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.sheets.v4.Sheets;
import com.google.api.services.sheets.v4.SheetsScopes;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.YouTubeScopes;

@Component
public class GoogleApiClient {
	private Sheets sheets;
    private YouTube youTube;
    public void GoogleAPIClient(@Value("${api.google.appName") String appName, @Value("${api.google.serviceAccountAuthFile}") String keyFileName) throws IOException, GeneralSecurityException {
        InputStream keyFile = ResourceUtils.getURL("classpath:" + keyFileName).openStream();
        GoogleCredential credential = GoogleCredential.fromStream(keyFile).createScoped(Arrays.asList(SheetsScopes.SPREADSHEETS, YouTubeScopes.YOUTUBE));
        NetHttpTransport transport = GoogleNetHttpTransport.newTrustedTransport();
        sheets = new Sheets.Builder(transport, JacksonFactory.getDefaultInstance(), credential).setApplicationName(appName).build();
        youTube = new YouTube.Builder(transport, JacksonFactory.getDefaultInstance(), credential).setApplicationName(appName).build();
    }
}
