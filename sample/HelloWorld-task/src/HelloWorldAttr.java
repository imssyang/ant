import org.apache.tools.ant.Task;
import org.apache.tools.ant.BuildException;

public class HelloWorldAttr extends Task {

    String message;
    public void setMessage(String msg) {
        message = msg;
    }

    public void execute() {
        if (message == null) {
            throw new BuildException("No message set.");
        }
        log(message);
    }

}
