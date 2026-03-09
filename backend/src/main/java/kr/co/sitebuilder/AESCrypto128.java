package kr.co.sitebuilder;

import org.apache.commons.codec.binary.Hex;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;

public class AESCrypto128 {
    final private SecretKeySpec secretKeySpec;
    final private Cipher cipher;
    final private static AESCrypto128 instance = new AESCrypto128();

    public AESCrypto128() {
        String CryptKey = "volk_sitebuilder.co.kr!"; // must be 16 characters
        try {
            final byte[] finalKey = new byte[16];
            int i = 0;
            for (byte b : CryptKey.getBytes(StandardCharsets.UTF_8))
                finalKey[i++ % 16] ^= b;

            secretKeySpec = new SecretKeySpec(finalKey, "AES");
            cipher = Cipher.getInstance("AES");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public String encrypt(final String str) throws Exception {
        if (str == null) {
            return null;
        }

        cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
        return new String(Hex.encodeHex(cipher.doFinal(str.getBytes(StandardCharsets.UTF_8)))).toUpperCase();
    }

    public String decrypt(final String str) {
        try {
            cipher.init(Cipher.DECRYPT_MODE, secretKeySpec);
            return new String(cipher.doFinal(Hex.decodeHex(str.toCharArray())));
        } catch (Exception e) {
            return null;
        }
    }

    public static AESCrypto128 getInstance() {
        return instance;
    }
}
