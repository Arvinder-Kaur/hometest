package passwordUtil;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Scanner;
import java.util.function.BinaryOperator;

public class DictionaryRepo {
	private HashSet<String> dictionaryWords = new HashSet<String>();
	private static DictionaryRepo dictionary = null;
	private ClassLoader classLoader = DictionaryRepo.class.getClassLoader();

	private DictionaryRepo() throws Exception {
		try {
			String filePath = classLoader.getResource("dictionary.txt").getFile();
			File file = new File(filePath);
			
			Scanner sc = new Scanner(file);
			while (sc.hasNextLine())
				dictionaryWords.add(sc.nextLine());
			
			sc.close();
		} catch (Exception ex) {
			throw new Exception("Could not initialise Dictionary");
		}
	}

	public static DictionaryRepo getInstance() throws Exception {
		if (dictionary == null)
			dictionary = new DictionaryRepo();

		return dictionary;
	}

	public boolean checkIfPasswordExistsInDictionary(String newPassword) {
		
		if (newPassword.length() > 14)
			return false;
		if (dictionaryWords.contains(newPassword))
			return true;
		return false;
		

	}
}
