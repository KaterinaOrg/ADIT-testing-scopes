package ee.adit.integrationtests;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ee.adit.dao.MaintenanceJobDAO;
import ee.adit.dao.pojo.MaintenanceJob;
import junit.framework.Assert;

/**
 * @author Hendrik Pärna
 * @since 15.07.14
 */
//@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:integration-tests.xml"})
public class MaintenanceJobDAO_Integration {

    @Autowired
    private MaintenanceJobDAO maintenanceJobDAO;

    //@Test
    public void testInitializingJobStatuses() throws Exception {
        maintenanceJobDAO.initializeJobRunningStatuses();
        List<MaintenanceJob> jobs = maintenanceJobDAO.findAllJobs();
        if (jobs != null) {
            for (MaintenanceJob job: jobs) {
                Assert.assertTrue(!job.isRunning());
            }
        }
    }
}
