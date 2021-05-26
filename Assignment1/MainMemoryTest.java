package arch.sm213.machine.student;

import machine.AbstractMainMemory.InvalidAddressException;
import org.junit.Before;
import org.junit.Test;
import static junit.framework.TestCase.assertTrue;
import static junit.framework.TestCase.fail;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

public class MainMemoryTest {

  private MainMemory memoryTest;

  @Before
  public void setup()
  {
    memoryTest = new MainMemory(256);
  }

  @Test
  public void testIsAccessAlignedTrue() {
    assertTrue(memoryTest.isAccessAligned(8,4));

    assertTrue(memoryTest.isAccessAligned(0,7));

    assertTrue(memoryTest.isAccessAligned(12,3));

    assertTrue(memoryTest.isAccessAligned(4,1));
  }

  @Test
  public void testIsAccessAlignedFalse() {
    assertFalse(memoryTest.isAccessAligned(7,6));

    assertFalse(memoryTest.isAccessAligned(9,12));

    assertFalse(memoryTest.isAccessAligned(10,3));

    assertFalse(memoryTest.isAccessAligned(15,4));
  }

  @Test
  public void testBytesToInteger() {
    int number1 = memoryTest.bytesToInteger((byte) 0x0, (byte) 0x0, (byte) 0x0, (byte) 0x0);
    int number2 = memoryTest.bytesToInteger((byte) 0x37, (byte) 0xF3, (byte) 0x8D, (byte) 0x23);
    int number3 = memoryTest.bytesToInteger((byte) 0x58, (byte) 0x3D, (byte) 0x5F, (byte) 0x2A);
    int number4 = memoryTest.bytesToInteger((byte) 0x2A, (byte) 0x76, (byte) 0x38, (byte) 0x43);

    assertEquals(number1, 0);
    assertEquals(number2, 938708259);
    assertEquals(number3, 1480417066);
    assertEquals(number4, 712390723);
  }

  @Test
  public void testIntegerToBytes1() {
    byte[] value = new byte [4];
    int integer1 = 712390723;
    value = memoryTest.integerToBytes(integer1);

    assertEquals(value[0], 0x2A);
    assertEquals(value[1], 0x76);
    assertEquals(value[2], 0x38);
    assertEquals(value[3], 0x43);
  }

  @Test
  public void testIntegerToBytes2() {
    byte[] value = new byte [4];
    int integer2 = 1480417066;
    value = memoryTest.integerToBytes(integer2);

    assertEquals(value[0], 0x58);
    assertEquals(value[1], 0x3D);
    assertEquals(value[2], 0x5F);
    assertEquals(value[3], 0x2A);
  }

  @Test
  public void testSetAndGet1() throws InvalidAddressException {
    byte[] input1 = {100, 24};
    byte[] input2 = {83, 43};

    memoryTest.set(24, input1);
    memoryTest.set(39, input2);

    byte[] output1 = memoryTest.get(24, 2);
    byte[] output2 = memoryTest.get(39, 2);

    assertTrue(output1[0] == input1[0] && output1[1] == input1[1]);
    assertTrue(output2[0] == input2[0] && output2[1] == input2[1]);
  }

  @Test
  public void testSetAndGet2() throws InvalidAddressException {
    byte[] input1 = {55, 11};
    byte[] input2 = {22, 76};

    memoryTest.set(12, input1);
    memoryTest.set(82, input2);

    byte[] output1 = memoryTest.get(12, 2);
    byte[] output2 = memoryTest.get(82, 2);

    assertTrue(output1[0] == input1[0] && output1[1] == input1[1]);
    assertTrue(output2[0] == input2[0] && output2[1] == input2[1]);
  }

  @Test
  public void testSetInvalidAddressException() {
    byte[] input1 = {100, 24};

    try {
      memoryTest.set(-5, input1);
      fail();
    } catch (InvalidAddressException e) {
      // do nothing
    }
  }

  @Test
  public void testSetInvalidAddressException2() {
    byte[] input1 = {100, 24};

    try {
      memoryTest.set(256, input1);
      fail();
    } catch (InvalidAddressException e) {
      // do nothing
    }
  }

  @Test
  public void testGetInvalidAddressException1() {
    byte[] input1 = {100, 24};

    try {
      memoryTest.set(24, input1);
    } catch (InvalidAddressException e) {
      fail();
    }

    try {
      byte[] output1 = memoryTest.get(-5, 2);
      fail();
    } catch (InvalidAddressException e) {
      //do nothing
    }
  }

  @Test
  public void testGetInvalidAddressException2() {
    byte[] input1 = {100, 24};

    try {
      memoryTest.set(24, input1);
    } catch (InvalidAddressException e) {
      fail();
    }

    try {
      byte[] output1 = memoryTest.get(256, 2);
      fail();
    } catch (InvalidAddressException e) {
      //do nothing
    }
  }

  @Test
  public void testLength() {
    assertEquals(memoryTest.length(), 256);
  }

}
