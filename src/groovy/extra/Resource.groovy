package extra

import com.linkshare.Topic
import com.linkshare.User

public abstract class Resource {
    Topic topic
    User createdBy
    String description
    static constraints = {
        description(empty:false)
    }
}
