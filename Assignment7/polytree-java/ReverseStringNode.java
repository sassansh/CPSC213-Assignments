public class ReverseStringNode extends StringNode {
  ReverseStringNode(String s) {
    super(s);
  }

  @Override
  int compareTo(Node n) {
    StringNode sn = (StringNode) n;
    return - s.compareTo(sn.s);
  }
}