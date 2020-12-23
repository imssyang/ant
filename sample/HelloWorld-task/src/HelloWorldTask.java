import org.apache.tools.ant.Project;

public class HelloWorldTask {

    private Project project;

    public void setProject(Project proj) {
        project = proj;
    }

    public void execute() {
        String message = project.getProperty("ant.project.name");
        project.log("Here is project '" + message + "'.", Project.MSG_INFO);
        System.out.println("Hello World");
    }
}
