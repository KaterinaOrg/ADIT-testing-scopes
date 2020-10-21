package ee.adit.test.util;

import java.util.Calendar;
import java.util.Date;

import ee.adit.pojo.PersonName;
import ee.adit.util.Util;
import junit.framework.TestCase;

import static java.util.Calendar.MILLISECOND;

/**
 * The class <code>UtilTest</code> contains tests for the class {@link
 * <code>Util</code>}.
 *
 * @pattern JUnit Test Case
 *
 * @generatedBy CodePro at 31.03.11 17:36
 *
 * @author Jaak Lember, Interinx, jaak@interinx.com
 */
public class UtilTest extends TestCase {

	/**
	 * Construct new test instance.
	 *
	 * @param name the test name
	 */
	public UtilTest(String name) {
		super(name);
	}

	/**
	 * Run the String getFileExtension(String) method test.
	 */
	public void testGetFileExtension() {
		assertNull(Util.getFileExtension(null));
		assertNull(Util.getFileExtension(""));
		assertNull(Util.getFileExtension("."));
		assertNull(Util.getFileExtension("test"));
		assertEquals("txt", Util.getFileExtension("test.txt"));
		assertEquals("svn", Util.getFileExtension(".svn"));
		assertEquals("TXT", Util.getFileExtension("test.TXT"));
		assertEquals("gz", Util.getFileExtension("test.txt.gz"));
	}

	public void testGetFileNameWithoutExtension() {
		assertNull(Util.getFileNameWithoutExtension(null));
		assertNull(Util.getFileNameWithoutExtension(""));
		assertNull(Util.getFileNameWithoutExtension("."));
		assertEquals("test", Util.getFileNameWithoutExtension("test"));
		assertEquals("test", Util.getFileNameWithoutExtension("test.txt"));
		assertNull(Util.getFileNameWithoutExtension(".svn"));
		assertEquals("test", Util.getFileNameWithoutExtension("test.TXT"));
		assertEquals("test.txt", Util.getFileNameWithoutExtension("test.txt.gz"));
	}

	public void testGetDateDiffInMilliseconds_NullParameters_ExpectLongMinValue() {
		assertEquals(Long.MIN_VALUE, Util.getDateDiffInMilliseconds(null, null));
	}

	public void testGetDateDiffInMilliseconds_SingleNullParameter_ExpectLongMinValue() {
		Date notNullParameter = new Date();
		assertEquals(Long.MIN_VALUE, Util.getDateDiffInMilliseconds(notNullParameter, null));
		assertEquals(Long.MIN_VALUE, Util.getDateDiffInMilliseconds(null, notNullParameter));
	}

	public void testGetDateDiffInMilliseconds_UsingDateConstructor() {
		Date earlierDate = new Date(2011, 7, 26, 16, 0, 0);
		Date laterDate = new Date(2011, 7, 26, 16, 0, 1);
		assertEquals(1000L, Util.getDateDiffInMilliseconds(earlierDate, laterDate));
		assertEquals(-1000L, Util.getDateDiffInMilliseconds(laterDate, earlierDate));
	}

	public void testGetDateDiffInMilliseconds_UsingCalendar() {
		Calendar earlierCal = Calendar.getInstance();
		Calendar laterCal = Calendar.getInstance();
		earlierCal.set(2011, 7, 26, 16, 0, 0);
		earlierCal.set(MILLISECOND, 0);
		laterCal.set(2011, 7, 26, 16, 0, 1);
		laterCal.set(MILLISECOND, 0);
		Date earlierDate = earlierCal.getTime();
		Date laterDate = laterCal.getTime();
		assertEquals(1000L, Util.getDateDiffInMilliseconds(earlierDate, laterDate));
		assertEquals(-1000L, Util.getDateDiffInMilliseconds(laterDate, earlierDate));
	}

	public void testCodeStartsWithCountryPrefix() {
		assertFalse(Util.codeStartsWithCountryPrefix(null));
		assertFalse(Util.codeStartsWithCountryPrefix(""));
		assertFalse(Util.codeStartsWithCountryPrefix("E"));
		assertTrue(Util.codeStartsWithCountryPrefix("EE"));
		assertTrue(Util.codeStartsWithCountryPrefix("EE70006317"));
		assertFalse(Util.codeStartsWithCountryPrefix("E70006317"));
		assertFalse(Util.codeStartsWithCountryPrefix("70006317"));
		assertTrue(Util.codeStartsWithCountryPrefix("EE3710101021"));
		assertFalse(Util.codeStartsWithCountryPrefix("E3710101021"));
		assertFalse(Util.codeStartsWithCountryPrefix("3710101021"));
	}

	public void testIsHexString() {
		assertFalse(Util.isHexString(null));
		assertFalse(Util.isHexString(""));
		assertFalse(Util.isHexString("g"));
		assertFalse(Util.isHexString("-"));
		assertTrue(Util.isHexString("a06529cfdbe5fe1e7ca4ac80f81f9398f2bf7536358251de6d21018cc1fa95ad31c930923ce233929db12ee925dce0b980df6bfdfe0e208cfaa3bfe24335e2596c0538ec6eb62dc9ed55533b122eb675b2d555976df7ca6285c66aed57fb05ab28b89e28a0f2277a9b29efcd6354b82d962e6c59b3a704da6062c36d3f6ffaca"));
	}

	public void testSplitPersonName_InputNull() {
		PersonName actual = Util.splitPersonName(null);
		assertEquals("", actual.getFirstName());
		assertEquals("", actual.getSurname());
	}

	public void testSplitPersonName_InputEmpty() {
		PersonName actual = Util.splitPersonName("");
		assertEquals("", actual.getFirstName());
		assertEquals("", actual.getSurname());
	}

	public void testSplitPersonName_InputOneWordName() {
		PersonName actual = Util.splitPersonName("Kiigelaulukuuik");
		assertEquals("", actual.getFirstName());
		assertEquals("Kiigelaulukuuik", actual.getSurname());
	}

	public void testSplitPersonName_InputTwoWordNameForward() {
		PersonName actual = Util.splitPersonName("Jaak Lember");
		assertEquals("Jaak", actual.getFirstName());
		assertEquals("Lember", actual.getSurname());
	}

	public void testSplitPersonName_InputTwoWordNameReversed() {
		PersonName actual = Util.splitPersonName("Lember, Jaak");
		assertEquals("Jaak", actual.getFirstName());
		assertEquals("Lember", actual.getSurname());
	}

	public void testSplitPersonName_InputThreeWordNameForward() {
		PersonName actual = Util.splitPersonName("Jaak Voldemar Lember");
		assertEquals("Jaak", actual.getFirstName());
		assertEquals("Voldemar Lember", actual.getSurname());
	}

	public void testSplitPersonName_InputThreeWordNameReversed() {
		PersonName actual = Util.splitPersonName("Lember, Jaak Voldemar");
		assertEquals("Jaak Voldemar", actual.getFirstName());
		assertEquals("Lember", actual.getSurname());
	}


	/*public void testDateToXMLDate() {
		assertEquals(null, Util.dateToXMLDate(null));
	}*/
}

/*$CPS$ This comment was generated by CodePro. Do not edit it.
 * patternId = com.instantiations.assist.eclipse.pattern.testCasePattern
 * strategyId = com.instantiations.assist.eclipse.pattern.testCasePattern.junitTestCase
 * additionalTestNames =
 * assertTrue = false
 * callTestMethod = true
 * createMain = false
 * createSetUp = false
 * createTearDown = false
 * createTestFixture = false
 * createTestStubs = false
 * methods = getFileExtension(QString;)
 * package = ee.adit.test.util
 * package.sourceFolder = adit-war/src/test/java
 * superclassType = junit.framework.TestCase
 * testCase = UtilTest
 * testClassType = ee.adit.util.Util
 */
