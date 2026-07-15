public class TaskLinkedList {

    TaskNode head;

    public void add(Task task) {

        TaskNode node = new TaskNode(task);

        if (head == null) {
            head = node;
            return;
        }

        TaskNode temp = head;

        while (temp.next != null)
            temp = temp.next;

        temp.next = node;
    }

    public void traverse() {

        TaskNode temp = head;

        while (temp != null) {
            System.out.println(temp.task);
            temp = temp.next;
        }
    }

    public Task search(int id) {

        TaskNode temp = head;

        while (temp != null) {
            if (temp.task.taskId == id)
                return temp.task;
            temp = temp.next;
        }

        return null;
    }

    public void delete(int id) {

        if (head == null)
            return;

        if (head.task.taskId == id) {
            head = head.next;
            return;
        }

        TaskNode temp = head;

        while (temp.next != null) {

            if (temp.next.task.taskId == id) {
                temp.next = temp.next.next;
                return;
            }

            temp = temp.next;
        }
    }
}