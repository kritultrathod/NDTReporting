package ndt_reporting_resuable;

import java.io.File;
import java.util.concurrent.TimeUnit;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.AfterSuite;
import org.testng.annotations.BeforeSuite;

public class Initial {

	public static final WebDriver driver = new FirefoxDriver();
	//public static final WebDriver driver = new InternetExplorerDriver();


	@BeforeSuite
	public void setUp() throws Exception {
		driver.manage().timeouts().implicitlyWait(20, TimeUnit.SECONDS);
		driver.manage().window().maximize();
	}
	@AfterSuite
	public void tearDown() throws Exception {
		driver.quit();
		System.out.println("Done!!");
	}

	public String[][] getTableArray(String xlFilePath, String sheetName, String tableName){
		String[][] tabArray=null;
		try{
			Workbook workbook = Workbook.getWorkbook(new File(xlFilePath));
			Sheet sheet = workbook.getSheet(sheetName);
			int startRow,startCol, endRow, endCol,ci,cj;
			Cell tableStart=sheet.findCell(tableName);
			startRow=tableStart.getRow();
			startCol=tableStart.getColumn();

			Cell tableEnd= sheet.findCell(tableName, startCol+1,startRow+1, 100, 64000,  false);

			endRow=tableEnd.getRow();
			endCol=tableEnd.getColumn();

			System.out.println("startRow="+startRow+", endRow="+endRow+", " +
					"startCol="+startCol+", endCol="+endCol);
			tabArray=new String[endRow-startRow-1][endCol-startCol-1];
			ci=0;

			for (int i=startRow+1;i<endRow;i++,ci++){
				cj=0;
				for (int j=startCol+1;j<endCol;j++,cj++){
					tabArray[ci][cj]=sheet.getCell(j,i).getContents();
				}
			}
		}
		catch (Exception e)    {
			System.out.println("error in getTableArray()");
		}

		return(tabArray);
	}
}
