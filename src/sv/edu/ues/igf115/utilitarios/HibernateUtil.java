package sv.edu.ues.igf115.utilitarios;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.*;

public class HibernateUtil {
    private static SessionFactory sessionFactory;
    
    public HibernateUtil(){ 
        try {
        	Configuration configuration = new Configuration();
            configuration.configure();
            ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();        
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);          
        } catch (Throwable e) {
            throw new ExceptionInInitializerError(e);
        }
    }
        
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}