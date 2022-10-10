namespace SampleTests;

public class Tests
{
    [TestCase(1, 2, 3)]
    [TestCase(2, 2, 4)]
    public void Add_AddTwoValue_ReturnsSum(int a, int b, int expected)
    {
        // Arrange
        var sut = new Sample.Calculate();

        // Act
        var actual = sut.Add(a, b);

        // Assert
        Assert.That(actual, Is.EqualTo(expected))
    }
}
